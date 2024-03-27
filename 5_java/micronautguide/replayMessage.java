package example.micronaut;

import io.micronaut.serde.annotation.Serdeable;

@Serdeable
public class replayMessage {
    private String message;

    // messageフィールドのゲッター
    public String getMessage() {
        return message;
    }

    // messageフィールドのセッター
    public void setMessage(String message) {
        this.message = message;
    }
}

