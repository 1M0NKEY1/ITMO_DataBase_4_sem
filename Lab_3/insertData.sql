DO
$do$
DECLARE
   i integer;
BEGIN
   FOR i IN 0..10000 LOOP
      INSERT INTO customers (customerName, address)
      VALUES (
         md5(random()::text),
         md5(random()::text)
      );
   END LOOP;


END
$do$;
