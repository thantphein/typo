Feature: Merge Articles
  As a blog administrator
  In order to remove duplicated articles
  I want to be able to merge articles with same topic

  Background:
    Given the blog is set up
    Given the following users exist:
      | profile_id | login | name | password | email       | state  |
      | 2          | john  | john | 12345  | john@snow.com | active |
      | 3          | doe   | doe  | 12345  | doe@snow.com  | active |

    Given the following articles exist:
      | id | title  | author | user_id | body  | allow_comments | published | published_at        | state     | type    |
      | 3  | Title1 | john   | 2       | body1 | true           | true      | 2013-02-11 00:00:00 | published | Article |
      | 4  | Title2 | doe    | 3       | body2 | true           | true      | 2013-02-11 00:00:00 | published | Article |

  Scenario: A non-admin cannot merge articles
    Given I am logged in with username "john" and password "12345"
    And I am on the edit article page of article 3
    Then I should not see "Merge Articles"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    And I am logged into the admin panel
    And I am on the edit article page of article 3
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "4"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Articles successfully merged!"
