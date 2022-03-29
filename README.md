
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

