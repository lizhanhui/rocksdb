
def _expand_build_version_impl(ctx):
    out = ctx.actions.declare_file(ctx.label.name + ".cc")
    ctx.actions.expand_template(
        template = ctx.file.template_file,
        output = out,
        substitutions = {
            "@GIT_SHA@": ctx.attr.git_sha,
            "@GIT_TAG@": ctx.attr.git_tag,
            "@GIT_MOD@": ctx.attr.git_mod,
            "@BUILD_DATE@": ctx.attr.build_date,
            "@GIT_DATE@": ctx.attr.git_date,
        }
    )
    return [DefaultInfo(files = depset([out]))]

expand_build_version = rule(
    implementation = _expand_build_version_impl,
    attrs = {
        "build_date": attr.string(mandatory=True),
        "git_sha": attr.string(mandatory=True),
        "git_tag": attr.string(mandatory=True),
        "git_mod": attr.string(mandatory=True),
        "git_date": attr.string(mandatory=True),
        "template_file": attr.label(allow_single_file = True),
    },
)