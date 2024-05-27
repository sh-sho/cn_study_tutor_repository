package com.oracle;

import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.*;

@Controller("/greet")
public class Greet {
    @Get(produces = MediaType.TEXT_PLAIN)
    public String index() {
        return "{\"message\": \"Hello world\"}";
    }
}
