#include "utilities/rocketmq/rocketmq_compaction_filter.h"

#include <endian.h>
#include <cstring>
namespace ROCKSDB_NAMESPACE {
namespace rocketmq {

bool RocketmqIndexCompactionFilter::Filter(int/*level*/, 
                                           const Slice &/*key*/,
                                           const Slice &existing_value,
                                           std::string *new_value,
                                           bool *changed) const {
  const char *data = existing_value.data();
  std::size_t len = existing_value.size();
  std::size_t element_size = sizeof(std::int64_t);
  bool purged = false;
  std::string reserved;
  reserved.reserve(len);
  char* base = const_cast<char*>(reserved.data());
  std::size_t bytes_copied = 0;
  for (std::size_t i = 0; i < len;) {
    const auto *ptr = reinterpret_cast<const std::int64_t *>(data + i);
    // Convert network byte-order to host byte-order
    // https://man7.org/linux/man-pages/man3/endian.3.html
    std::int64_t offset = be64toh(*ptr);
    if (offset < min_commit_log_offset_) {
      purged = true;
    } else if (!bytes_copied) {
      memcpy(base, data + i, element_size);
      bytes_copied += element_size;
    } else {
      memcpy(base + bytes_copied, data + i - 1, element_size + 1);
      bytes_copied += element_size + 1;
    }
    i += element_size + 1;
  }

  if (purged && !bytes_copied) {
    // All commit-log offsets are invalidated
    return true;
  }

  if (!purged) {
    // None of the commit-log offsets is invalidated
    return false;
  }

  // One or more commit-log offsets is invalidated
  reserved.resize(bytes_copied);
  new_value->swap(reserved);
  *changed = true;
  return false;
}

}  // namespace rocketmq

}  // namespace ROCKSDB_NAMESPACE