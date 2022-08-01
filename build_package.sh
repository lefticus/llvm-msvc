git clone --depth 1 --branch llvmorg-10.0.1 git@github.com:llvm/llvm-project llvm-project

patch -p1 -d llvm-project -i ../llvm-msvc.patch

cmake -G "Visual Studio 17 2022" -A x64 -T "host=x64" -S llvm-project/llvm -B llvm-build -D LLVM_ENABLE_PROJECTS:STRING="clang;lld;libc" -D LLVM_BUILD_TESTS:BOOL=FALSE -D LLVM_TARGETS_TO_BUILD:STRING="X86" -D LLVM_TOOL_LLD_BUILD:BOOL=TRUE

cmake --build llvm-build/ --config Release

cd llvm-build
cpack -C Release
