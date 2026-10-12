import pytest

def test_addition():
    assert 2 + 2 == 4

def test_string_length():
    assert len("hello") == 5

def test_list_comprehension():
    squares = [x ** 2 for x in range(3)]
    assert squares == [0, 1, 4]
