workspace(name = "com_github_facebook_rocksdb")

load("@com_github_facebook_rocksdb//bazel:rocksdb_deps.bzl", "rocksdb_deps")
rocksdb_deps()

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
bazel_skylib_workspace()

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")
rules_foreign_cc_dependencies()