const std = @import("std");
const builtin = @import("builtin");
const tests = @import("tests.zig");

pub fn addCases(cases: *tests.StandaloneContext) void {
    cases.addBuildFile("test/link/bss/build.zig", .{
        .build_modes = false, // we only guarantee zerofill for undefined in Debug
    });

    cases.addBuildFile("test/link/dylib/build.zig", .{
        .build_modes = true,
    });

    cases.addBuildFile("test/link/common_symbols/build.zig", .{
        .build_modes = true,
    });

    cases.addBuildFile("test/link/common_symbols_alignment/build.zig", .{
        .build_modes = true,
    });

    cases.addBuildFile("test/link/interdependent_static_c_libs/build.zig", .{
        .build_modes = true,
    });

    cases.addBuildFile("test/link/static_lib_as_system_lib/build.zig", .{
        .build_modes = true,
    });

    cases.addBuildFile("test/link/tls/build.zig", .{
        .build_modes = true,
    });

    if (builtin.os.tag == .macos) {
        cases.addBuildFile("test/link/frameworks/build.zig", .{
            .build_modes = true,
            .requires_macos_sdk = true,
        });

        // Try to build and run an Objective-C executable.
        cases.addBuildFile("test/link/objc/build.zig", .{
            .build_modes = true,
            .requires_macos_sdk = true,
        });

        // Try to build and run an Objective-C++ executable.
        cases.addBuildFile("test/link/objcpp/build.zig", .{
            .build_modes = true,
            .requires_macos_sdk = true,
        });
    }
}
