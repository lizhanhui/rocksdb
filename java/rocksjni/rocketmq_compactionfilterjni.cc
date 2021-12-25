#include <jni.h>

#include "include/org_rocksdb_RocketMQIndexCompactionFilter.h"
#include "utilities/rocketmq/rocketmq_compaction_filter.h"

jlong Java_org_rocksdb_RocketMQIndexCompactionFilter_createNewIndexCompactionFilter0(JNIEnv *, jclass,
 jlong min_commit_log_offset) {
  auto* compaction_filter = new ROCKSDB_NAMESPACE::rocketmq::RocketmqIndexCompactionFilter(min_commit_log_offset);
  // set the native handle to our native compaction filter
  return reinterpret_cast<jlong>(compaction_filter);
}