
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