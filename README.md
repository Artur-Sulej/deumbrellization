# Deumbrellization

Example application used for talk on Elixir Meetup [Warsaw.ex](https://www.meetup.com/warsaw-ex/events/291321723/).

* [Talk video](https://www.youtube.com/watch?v=PyeUl4Go4Yk)
* [Presentation slides](talk_slides.pdf)

## How to run?

apps/todo_web/:

`elixir --sname deumbrellization-todo-web -S mix phx.server`

apps/todo/:

`elixir --sname deumbrellization-todo -S mix run --no-halt`
