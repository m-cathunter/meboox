# MEBOOX

## The project

We want to provide a lighter version of Nextoy that could manage a little
books catalog.

For that, we have started to develop an API to be able to list all our books,
their author and comments.

We now want to bring new features and improve others.


## Before starting

To start the project, you need to have installed Ruby at version `2.6.5` and
the gem Bundler.

For simplicity, we use the SQLite database.

The database could be populated by the `rails db:seed` command to build up some
data as starting point.

To provide JSON from our API, we choose to use the gem [ActiveModelSerializer](https://github.com/rails-api/active_model_serializers/tree/v0.10.6/docs).

And at least, you can find the `mebook.insomnia.json` file to setup the
[Insomnia](https://insomnia.rest/) REST Client and be able to check the
API endopints.


## TODO List

We are expecting that each tasks is done in one git commit. This will help us
to review your code.

You could sometimes have _Bonus_ tasks. They are not mandatory and you can
skip them if you don't have enought time.

Try to not exceed, as much as possible, 1 hour.

You will notice that the exercises are very directives and expect a fairly
oriented implementation. Do not hesitate to add a file in addition
to your implementation in which you would like to provide another vision of
the task requested (a simple text vaguely explaining your idea will
be sufficient, no need to do any implementation).


### Provide the fullname of the authors

In the author serializer, we need to add the author's `fullname`.

For this task, we expect:

- A new method `full_name` defined in the `Author` model
- The `full_name` format like that: `<last_name> <first_name>`
- We don't want a new model attribute
- We need to provide the `full_name` in the author serializer


### Provide pagination

For now, we returns all the books. When we will have a lot of books, we probably
have too much useless books returns and also, this could overload our platform.
To avoid this case, we need to provide a pagination.

For this task, we expect that the `GET /books` endpoint provide the pagination
and accept the parameters:

- `page`: that represent the page we want
- `per`: the number of books per pages

_Bonus_: Now that we have this pagination, we would like to implement it
to the `authors` and `comments` endpoints too.


### Provide the add comment feature

We do not have an endpoint to add a new comment to a book.

With this task, we expect to get this endpoint with these constraints:

- The endpoint have to be : `POST /books/:book_id/comments`
- We allow to provide only these attributes : `nickname` et `content`
- When succeed, the endpoint should only returns the HTTP status `200`
- When failed, the endpoint should returns the HTTP status `422` with
  the relevant error message
- _Bonus_: We don't allow a visitor to comment more than one the same book


### Provide a new feature : rating

Our current comments are only use to... comment a book!
We would like to allow to users the ability to provide a rate to the book when
they comments it.

For this task, we expect:

- We want a new `stars` attribute to the `Comment` model
- This attribute have to be a number between `0` and `5`
- This is an optionnal attribute to create a comment
- We want it to be present in the comment serializer (leave a `nil` value
  when it is not defined)
- _Bonus_: We would like to have the comments ordered by the better rating first
  when we request all the book's comments


### Improve the book serializer

You probably noticed that we have 2 kind of books: `Book` (for ebooks) and
`AudioBook` (for audiobooks). But for now, we don't have nothing to identify
them in the book serializer.

This task is here to improve our book serializer by:

- Adding a `type` attribute to let now if the book is an ebook are audiobook
- Adding a `duration` attribute but only for the audiobooks (we don't want
  to provide it for ebooks)


### _Bonus_: Add suggestions

We now want to have a very simple book suggestions when a book is show.
For that, we would like to return the 3 most rating books from the same author,
completed by the most rating books (in case the author does not have enough books).
And, of course, we don't want to have the current book in the suggestion, neither
having duplicated book.

Here are few constraints for this task:

- Add a new `suggestions` part in the book serialier
- We only want suggestions when asking for one book (`show` action), and not
  for all (`index action`)
- we expect that this change will not affect API performance significantly
