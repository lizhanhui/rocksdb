package org.rocksdb;

public class RocketMQIndexCompactionFilter extends AbstractCompactionFilter<Slice> {

    public RocketMQIndexCompactionFilter(final long minCommitLogOffset) {
        super(createNewIndexCompactionFilter0(minCommitLogOffset));
    }

    private native static long createNewIndexCompactionFilter0(long minOffset);
}
