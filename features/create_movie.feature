Feature: Create Movie

  So that cutomers can browse movies by genre
  As a site administrator 
  I want to create a movie in a specific genre

  Scenario: Create movie in genre
    Given a genre name Comedy
    When I create a movie Caddyshack in the Comedy genre
    Then Caddyshack should be in comedy genre
