Feature: Filter out movies that have ratings the users are not interested in.
 
Background: movies in database
 
  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
 
Scenario: Sort by title
  Given I am on the home page
  When I follow "Movie Title"
  Then I should see "Alien" before "Star Wars"
  
Scenario: Sort by release date
  Given I am on the home page
  When I follow "Release Date"
  Then I should see "Star Wars" before " Alien"