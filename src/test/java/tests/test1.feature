Feature: Modify XML Structure
Background:

 * def xml1 =
    """<people>
  <person>
    <forename>John</forename>
    <surname>Doe</surname>
    <age>25</age>
  </person>
  <person>
    <forename>Joe</forename>
    <surname>Bloggs</surname>
    <age>35</age>
  </person>
</people>
"""

  Scenario: add a new person named Jane Doe (I succeeded in replacing John with Jane)

    * set xml1/people/person/forename = 'Jane'
    * set xml1/people/person/surname = 'Doe'
    * set xml1/people/person/age = '30'
    * print xml1


  Scenario: Remove age from John Doe

    * remove xml1/people/person/age
    * print xml1

  Scenario: test removing and adding elements / attributes
    * def base = <query><name>foo</name></query>
    * remove base /query/name
    * match base == <query/>
    * set base /query/foo = 'bar'
    * set base /query/@baz = 'ban'
    * match base == <query baz="ban"><foo>bar</foo></query>
    * print base
   # * remove base /query/@baz
   # * match base == <query><foo>bar</foo></query>
   # * print base


    











