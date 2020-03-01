import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class Reservation {
    private final List<Rezerwacja> rezerwacje = new ArrayList<>();

    public void dodajRezerwacje(Rezerwacja rezerwacja) {
        Optional<Rezerwacja> foundRezerwacje = rezerwacje.stream()
//                .filter(a -> a.getSamochod().equals(rezerwacja.getSamochod()))
                .filter(a ->
                        (a.getDataOd().getTime() > rezerwacja.getDataOd().getTime() &&
                                a.getDataDo().getTime() < rezerwacja.getDataDo().getTime()

                        ) || (a.getDataOd().getTime() <= rezerwacja.getDataOd().getTime() &&
                                a.getDataDo().getTime() >= rezerwacja.getDataOd().getTime()

                        ) || (a.getDataOd().getTime() <= rezerwacja.getDataDo().getTime() &&
                                a.getDataDo().getTime() >= rezerwacja.getDataDo().getTime()
                        )
                ).findAny();
        if (!foundRezerwacje.isPresent()) {
            rezerwacje.add(rezerwacja);
        } else {
            throw new IllegalStateException();
        }
    }
}

