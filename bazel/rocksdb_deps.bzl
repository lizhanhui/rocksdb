load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def rocksdb_deps():
    maybe(
        http_archive,
        name = "com_github_jemalloc_jemalloc",
        sha256 = "ed51b0b37098af4ca6ed31c22324635263f8ad6471889e0592a9c0dba9136aea",
        url = "https://github.com/jemalloc/jemalloc/archive/refs/tags/5.2.1.tar.gz",
        strip_prefix = "jemalloc-5.2.1",
        build_file = "@com_github_facebook_rocksdb//bazel:jemalloc.BUILD",
    )

    maybe(
        http_archive,
        name = "rules_foreign_cc",
        sha256 = "1df78c7d7eed2dc21b8b325a2853c31933a81e7b780f9a59a5d078be9008b13a",
        urls = [
            "https://github.com/bazelbuild/rules_foreign_cc/archive/refs/tags/0.7.0.tar.gz",
        ],
        strip_prefix = "rules_foreign_cc-0.7.0",
    )

    maybe(
        http_archive,
        name = "com_github_madler_zlib",
        urls = [
            "https://github.com/madler/zlib/archive/refs/tags/v1.2.11.tar.gz",
        ],
        strip_prefix = "zlib-1.2.11",
        build_file = "@com_github_facebook_rocksdb//bazel:zlib.BUILD",
    )

    maybe(
        http_archive,
        name = "com_github_gflags_gflags",
        strip_prefix = "gflags-2.2.2",
        sha256 = "34af2f15cf7367513b352bdcd2493ab14ce43692d2dcd9dfc499492966c64dcf",
        urls = [
            "https://github.com/gflags/gflags/archive/refs/tags/v2.2.2.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "com_github_google_glog",
        strip_prefix = "glog-0.5.0",
        sha256 = "eede71f28371bf39aa69b45de23b329d37214016e2055269b3b5e7cfd40b59f5",
        urls = [
            "https://github.com/google/glog/archive/refs/tags/v0.5.0.tar.gz"
        ],
    )

    maybe(
        http_archive,
        name = "com_google_googletest",
        urls = ["https://github.com/google/googletest/archive/refs/tags/release-1.11.0.tar.gz"],
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