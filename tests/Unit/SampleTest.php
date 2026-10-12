<?php
declare(strict_types=1);

use PHPUnit\Framework\TestCase;

final class SampleTest extends TestCase
{
    public function testTrueAssertsToTrue(): void
    {
        self::assertTrue(true);
    }

    public function testAdditionWorks(): void
    {
        self::assertEquals(4, 2 + 2);
    }

    public function testStringLength(): void
    {
        self::assertEquals(5, strlen('hello'));
    }
}