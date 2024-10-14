# Ristorante

Ci sono due modalità di installazione e avvio:

- Attraverso Docker. Infatti andando con il terminale sulla root del progetto, lanciando il comando "docker-compose up --build" (il docker engine deve essere attivo) si creeranno e avvieranno il container del database e dell'applicazione web che potete raggiungere su http://127.0.0.1:3000. Il database sarà gia con alcuni dati per potervi rendere immediato l'utilizzo.

- Nel caso in cui vogliate avviare solo la parte dell'applicazione web, dovete assicurarvi di avere un servizio postgres nella macchina, basta andare dentro /ristorante e lanciare i comandi: 1) rails db:create, 2) rails db:migrate, 3) rails db:seed che creeranno lo schema del database e popoleranno la tabella ingredienti e tavoli per facilitarvi l'utilizzo. Per avviare lanciare il comando: rails server
