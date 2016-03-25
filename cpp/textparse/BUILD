
cc_binary(
    name = "test",
    srcs = ["test.cpp"],
    copts= [
        "-Iexternal/opencv/include",
        "-Iexternal/tesseract/include",
    ],
    deps = [
        "@opencv//:opencv",
        "@leptonica//:liblept",
        "@tesseract//:tesseract",
    ],
)
