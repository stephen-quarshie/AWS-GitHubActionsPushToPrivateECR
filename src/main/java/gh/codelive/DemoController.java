package gh.codelive;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class DemoController {
    @GetMapping("/home")
    public ResponseEntity<?> welcome() {
        return ResponseEntity.ok(Map.of("message", "Welcome to the home of champions"));
    }
}
