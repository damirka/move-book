// Copyright (c) Mysten Labs, Inc.
// SPDX-License-Identifier: Apache-2.0

// ANCHOR: module
module book::my_module {
    // module body
}
// ANCHOR_END: module

// ANCHOR: address_literal
module 0x0::address_literal_example {
    // module body
}
// ANCHOR_END: address_literal

// ANCHOR: address_block
address book { // address block

module another_module {
    // module body
}

module yet_another_module {
    // module body
}
}
// ANCHOR_END: address_block

#[allow(unused_function, unused_const, unused_use)]
// ANCHOR: members
module book::my_module_with_members {
    // import
    use book::my_module;

    // a constant
    const CONST: u8 = 0;

    // a struct
    public struct Struct {}

    // method alias
    public use fun function as Struct.struct_fun;

    // function
    fun function(_: &Struct) { /* function body */ }
}
// ANCHOR_END: members
