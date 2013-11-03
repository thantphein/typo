Feature: Merge Articles
  As a blog administrator
  In order to remove duplicated articles
  I want to be able to merge articles with same topic

  Background:
    Given the blog is set up
    Given the following users exist:
      | profile_id | login | name | password | email       | state  |
      | 2          | john  | john | 12345    | john@snow.com | active |
      | 3          | doe   | doe  | 12345    | doe@snow.com  | active |

    Given the following articles exist:
      | id | title  | author | user_id | body  | allow_comments | published | published_at        | state     | type    |
      | 3  | Title1 | john   | 2       | body1 | true           | true      | 2013-02-11 00:00:00 | published | Article |
      | 4  | Title2 | doe    | 3       | body2 | true           | true      | 2013-02-11 00:00:00 | published | Article |

    Given the following comments exist:
	| id | type    | author | body     | article_id   | user_id | 
	| 1  | Comment | john   | comment1 | 4		| 3	  | 
	| 2  | Comment | doe    | comment2 | 3		| 4	  | 

#  Scenario: A non-admin cannot merge articles
#    Given I am logged in with username "john" and password "12345"
#    And I am on the edit article page of article 3
#    Then I should not see "Merge Articles"

#  Scenario: An admin can merge articles
#    And I am logged into the admin panel
#    And I am on the edit article page of article 3
#    Then I should see "Merge Articles"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    And I am logged into the admin panel
    And I am on the edit article page of article 3
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "4"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Articles successfully merged!"

#  Scenario: When articles are merged, the merged article should have one author (either one of the authors of the original article).  
#    Given after merging articles "3" and "4"
#    And I am on the home page
#    Then I should see "Title1"
#    Then I should not see "Title2"
#    When I follow "Title1"
#    Then the author of Article "3" should be "john"
#    Then the author of Article "3" should not be "doe"
#    Then I should see "body1"
#    And I should see "body2" 

#  Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article.
#    Given after merging articles "3" and "4"
#    And I am on the home page
#    When I follow "Title1"
#    Then I should see "comment1"
#    And I should see "comment2"
    
  Scenario: The title of the new article should be the title from either one of the merged articles.
    Given after merging articles "3" and "4"
    And I am on the home page
    Then I should see "Title1"
    Then I should not see "Title2"
