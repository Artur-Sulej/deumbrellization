# Deumbrellization

Example application used for the talk: "Deumbrellization – cheap microservices" 

* [Presentation slides](talk_slides.pdf)
* [Talk video](https://www.youtube.com/watch?v=PyeUl4Go4Yk)

## How to run?

in `apps/todo_web/` run:

`elixir --sname deumbrellization-todo-web -S mix phx.server`

in `apps/todo/` run:

`elixir --sname deumbrellization-todo -S mix run --no-halt`

Then open:

`http://localhost:4000/tasks`
