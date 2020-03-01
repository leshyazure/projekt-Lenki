import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Date;

@Getter
@AllArgsConstructor

public class Rezerwacja {
    private Date dataOd;
    private Date dataDo;
}