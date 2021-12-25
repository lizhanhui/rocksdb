#pragma once

#include <cstdint>

#include "rocksdb/compaction_filter.h"
#include "rocksdb/slice.h"

namespace ROCKSDB_NAMESPACE {

namespace rocketmq {

class RocketmqIndexCompactionFilter : public CompactionFilter {
 public:
  explicit RocketmqIndexCompactionFilter(std::int64_t min_commit_log_offset)
      : min_commit_log_offset_(min_commit_log_offset) {}

  bool Filter(int level, const Slice& key, const Slice& existing_value,
              std::string* new_value, bool* changed) const override;

  static const char* kClassName() { return "RocketMQIndexCompactionFilter"; }
  
  const char* Name() const override { return kClassName(); }

 private:
  std::int64_t min_commit_log_offset_;
};

}  // namespace rocketmq

}  // namespace ROCKSDB_NAMESPACE