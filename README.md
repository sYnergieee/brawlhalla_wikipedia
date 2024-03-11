### Brawlhalla Wikipedia

### Demo [Click here](https://frontend-brawlhalla-wiki.vercel.app/) (without mailer)
<img src="https://github.com/sYnergieee/brawlhalla_wikipedia/assets/113714097/880db9e5-39ba-48a7-bc41-506ba137e115.png" width="1200" height="500">

## Main technologies used in this project 
FastAPI, Angular with PostgreSQL Redis, Celery (for mailer) </br>
Vakt for attribute access, Access and Refresh Token for authentication </br>
FileDoge service for user images

## How to run
1. In mailer.env password for mailer (external, third-party applications, not like in mail) and login (from mail) for sending messages) (in mail.env)
2. In .env SECRET_STRING for jwt tokens, command in linix, bash:
> $ openssl rand -hex 32
3. Run command
> docker compose up

## There are 2 roles: administrator and user
### User can
* Create account 
* Personalize profile (with choosing favorite heroes)
* Create reviews (for every hero only one)
* Create guides (for every hero)
* Create applications (for missing content or something)
* Like reviews/guides
### Administrator can
* Manage heroes
* Manage weapons
* Manage skins
* Manage users
* Impove users to administrators
