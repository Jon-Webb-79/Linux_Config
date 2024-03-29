// ================================================================================
// ================================================================================
// - File:    filename.c
// - Purpose: Describe the file purpose here
//
// Source Metadata
// - Author:  Jonathan A. Webb
// - Date:    August 31, 2022
// - Version: 1.0
// - Copyright: Copyright 2022, Jon Webb Inc.
// ================================================================================
// ================================================================================
// Include modules here

#include "test.h"

void test_func(void **state)
{
	(void) state;
	int a = 5;
	int b = 2;
	int c = a + b;
	assert_int_equal(c, 7);
}
// ================================================================================
// ================================================================================
// eof
