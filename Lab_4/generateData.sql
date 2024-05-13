CREATE OR REPLACE FUNCTION random_between(low INT, high INT) RETURNS INT AS $$
BEGIN
   RETURN floor(random()* (high-low + 1) + low);
END;
$$ LANGUAGE plpgsql;

do
$$
declare
   i int;
begin
   for i in 1..1000 loop
      INSERT INTO users (name, zipcode, birthday)
      VALUES (
         'User ' || i,
         random_between(10000, 99999),
         (current_date - (i || ' days')::interval)::date
      );
   END LOOP;
END;
$$;

DO
$$
DECLARE
   i INT;
BEGIN
   FOR i IN 1..1000 LOOP
      INSERT INTO orders (postcode, city)
      VALUES (
         random_between(10000, 99999),
         'City ' || i
      );
   END LOOP;
END;
$$;
