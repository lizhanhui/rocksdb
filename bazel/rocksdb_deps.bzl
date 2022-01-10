load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def rocksdb_deps():
    maybe(
        http_archive,
        name = "com_github_jemalloc_jemalloc",
        sha256 = "ed51b0b37098af4ca6ed31c22324635263f8ad6471889e0592a9c0dba9136aea",
        urls = [
            "https://shutian.oss-cn-hangzhou.aliyuncs.com/cdn/jemalloc/jemalloc-5.2.1.tar.gz",
            "https://github.com/jemalloc/jemalloc/archive/refs/tags/5.2.1.tar.gz",
        ],
        strip_prefix = "jemalloc-5.2.1",
        build_file = "@com_github_facebook_rocksdb//bazel:jemalloc.BUILD",
    )

    maybe(
        http_archive,
        name = "rules_foreign_cc",
        sha256 = "bcd0c5f46a49b85b384906daae41d277b3dc0ff27c7c752cc51e43048a58ec83",
        strip_prefix = "rules_foreign_cc-0.7.1",
        urls = [
            "https://shutian.oss-cn-hangzhou.aliyuncs.com/cdn/rules_foreign_cc/rules_foreign_cc-0.7.1.tar.gz",
            "https://github.com/bazelbuild/rules_foreign_cc/archive/0.7.1.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "com_github_madler_zlib",
        sha256 = "629380c90a77b964d896ed37163f5c3a34f6e6d897311f1df2a7016355c45eff",
        urls = [
            "https://shutian.oss-cn-hangzhou.aliyuncs.com/cdn/zlib/zlib-1.2.11.tar.gz",
            "https://github.com/madler/zlib/archive/refs/tags/v1.2.11.tar.gz",
        ],
        strip_prefix = "zlib-1.2.11",
        build_file = "@com_github_facebook_rocksdb//bazel:zlib.BUILD",
    )

    maybe(
        http_archive,
        name = "com_github_lz4_lz4",
        sha256 = "030644df4611007ff7dc962d981f390361e6c97a34e5cbc393ddfbe019ffe2c1",
        urls = [
            "https://shutian.oss-cn-hangzhou.aliyuncs.com/cdn/lz4/lz4-1.9.3.tar.gz",
            "https://github.com/lz4/lz4/archive/refs/tags/v1.9.3.tar.gz",
        ],
        strip_prefix = "lz4-1.9.3",
        build_file = "@com_github_facebook_rocksdb//bazel:lz4.BUILD",
    )

    maybe(
        http_archive,
        name = "com_github_facebook_zstd",
        sha256 = "dc05773342b28f11658604381afd22cb0a13e8ba17ff2bd7516df377060c18dd",
        urls = [
            "https://shutian.oss-cn-hangzhou.aliyuncs.com/cdn/zstd/zstd-1.5.1.tar.gz",
            "https://github.com/facebook/zstd/archive/refs/tags/v1.5.1.tar.gz",
        ],
        strip_prefix = "zstd-1.5.1",
        build_file = "@com_github_facebook_rocksdb//bazel:zstd.BUILD",
    )

    maybe(
        http_archive,
        name = "com_github_gflags_gflags",
        strip_prefix = "gflags-2.2.2",
        sha256 = "34af2f15cf7367513b352bdcd2493ab14ce43692d2dcd9dfc499492966c64dcf",
        urls = [
            "https://shutian.oss-cn-hangzhou.aliyuncs.com/cdn/gflags/gflags-2.2.2.tar.gz",
            "https://github.com/gflags/gflags/archive/refs/tags/v2.2.2.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "com_github_google_glog",
        strip_prefix = "glog-0.5.0",
        sha256 = "eede71f28371bf39aa69b45de23b329d37214016e2055269b3b5e7cfd40b59f5",
        urls = [
            "https://shutian.oss-cn-hangzhou.aliyuncs.com/cdn/glog/glog-0.5.0.tar.gz",
            "https://github.com/google/glog/archive/refs/tags/v0.5.0.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "com_google_googletest",
        urls = [
            "https://shutian.oss-cn-hangzhou.aliyuncs.com/cdn/googletest/googletest-release-1.11.0.tar.gz",
            "https://github.com/google/googletest/archive/refs/tags/release-1.11.0.tar.gz",
        ],
        strip_prefix = "googletest-release-1.11.0",
        sha256 = "b4870bf121ff7795ba20d20bcdd8627b8e088f2d1dab299a031c1034eddc93d5",
    )

    maybe(
        http_archive,
        name = "com_github_google_snappy",
        url = "https://github.com/google/snappy/archive/ed3b7b2.tar.gz",
        strip_prefix = "snappy-ed3b7b242bd24de2ca6750c73f64bee5b7505944",
        sha256 = "88a644b224f54edcd57d01074c2d6fd6858888e915c21344b8622c133c35a337",
        build_file = "@com_github_facebook_rocksdb//bazel:snappy.BUILD",
    )

    maybe(
        http_archive,
        name = "bazel_skylib",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.1.1/bazel-skylib-1.1.1.tar.gz",
        ],
        sha256 = "c6966ec828da198c5d9adbaa94c05e3a1c7f21bd012a0b29ba8ddbccb2c93b0d",
    )