<?php

namespace Tests\Unit;

use PHPUnit\Framework\TestCase;

class TestArticle extends TestCase
{
    /**
     * A basic unit test example.
     */
    public function test_example(): void
    {
        $data=[
            'name'     => 'Article 1',
            'email'    => 'article@gmail.com', 
            'password' => 'article123',
        ];
        $this->assertTrue(true);
    }
}
