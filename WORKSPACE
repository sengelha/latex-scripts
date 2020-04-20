load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Begin LaTeX support
http_archive(
    name = "bazel_latex",
    sha256 = "2d8d5f590cfc8aa8e6d155c37c2d3540f3ab4d23ac96a576cdda8a1cf1b1e3ed",
    strip_prefix = "bazel-latex-0.19",
    url = "https://github.com/ProdriveTechnologies/bazel-latex/archive/v0.19.tar.gz",
)

load("@bazel_latex//:repositories.bzl", "latex_repositories")

latex_repositories()
# End LaTeX support