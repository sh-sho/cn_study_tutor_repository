package com.example.fn;

public class HelloFunction {

    public static class Input {
        public String name;
    }

    public static class Result {
        public String message;
    }

    public Result handleRequest(Input input) {
        Result result = new Result();
        result.message = "こんにちは " + input.name;
        return result;
    }

}
