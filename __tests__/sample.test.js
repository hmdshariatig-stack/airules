function add(a, b) {
    return a + b;
}

describe('Sample Tests', () => {
    test('addition works', () => {
        expect(add(2, 2)).toBe(4);
    });

    test('string length is correct', () => {
        expect('hello'.length).toBe(5);
    });

    test('array mapping works', () => {
        const numbers = [1, 2, 3];
        const doubled = numbers.map(n => n * 2);
        expect(doubled).toEqual([2, 4, 6]);
    });
});