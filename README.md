
>> Setting up the database
1. connect to psql
2. Create the database with CREATE DATABASE bookmark_manager;
3. connect with \c bookmark_manager;
4. run the query in /db/migrations/01_create_bookmarks_table.sql


>> User Stories

 - Show a list of bookmarks

 > As a web user
 > So that I can be reminded of websites I want to revisit
 > I'd like to view a list of those sites



  Show bookmark list


  Request                              Controller                   Model               View

┌──────────────────┐                  ┌──────────────────┐         ┌──────────┐
│                  ├──────────────────►                  └─────────► read DB  │
│ Get /            │                  │ Get              ◄─────────┐          │        ┌─────────┐
│ Homepage         │                  │                  │         └──────────┘        │         │
│                  ◄──────────────────┤                  │                             │ home-   │
└──────────────────┘                  │                  └─────────────────────────────► page    │
                                      │                  ◄─────────────────────────────┐         │
                                      └──────────────────┘                             └─────────┘

 - Add new bookmarks

 > As a user
 > So that I can add more bookmarks to the list
 > I'd like an add bookmark feature

  - Delete bookmarks

 > As a user
 > So I don't see pages I no longer visit in the list
 > I would like to be able to delete bookmarks

  - Update Bookmarks

  > As a user
  > So that I can change the details of a bookmark if they are incorrect
  > I would like an update page

  Get update > Post changes >>redirect>> Get bookmarks
    ^^ view takes params, model updates db