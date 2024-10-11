#include <arm_neon.h>
#include <stdint.h>
#include <stdio.h>

uint8_t find_first_zero(uint8x16_t input) {
    // Create a mask where each byte is compared to zero
    uint8x16_t byte_mask = vceqq_u8(input, vdupq_n_u8(0));
    // Shift right to create the nibble mask
    uint8x8_t nibble_mask = vshrn_n_u16(vreinterpretq_u16_u8(byte_mask), 4);
    // Extract the first 64 bits (8 bytes)
    uint64_t m = vget_lane_u64(vreinterpret_u64_u8(nibble_mask), 0);
    printf("m as hex: 0x%016llx\n", m);
    // AND operation on m with 0x0000f000f000f000f to find only 0, 4, 8, 12 locations
    m &= 0x0000f000f000f000f;
    printf("After ands m as hex: 0x%016llx\n", m);
    // Check if any zero byte was found
    if (m != 0) {
        // Find the index of the first zero byte
        uint8_t index = __builtin_ctzll(m) >> 2; // Convert from bit position to byte index
        return index;
	}
    return -1; // Return -1 if not found
}

int main(void) {
    // Initialize a vector with 16 8-bit values
    uint8x16_t data = {1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    // Call the function to find the first zero
    uint8_t index = find_first_zero(data);
    // Print the index of the first zero
    // Since index 0 and 4 are 1, the next available for [>>>>] is 8
    // We disregard all the  zeros in other locations
    printf("First zero for [>>>>] found at index: %u\n", index);
    return 0;
}
// One can compile with -S flag to see the generated assembly
