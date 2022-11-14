class Item

    def initialize(genre, author, source, label, publish_date, archived)
        @id = Random.rand(1...1000)
        @genre=genre
        @author=author
        @source=source
        @label=label
        @publish_date=publish_date
        @archived=archived
    end

    def can_be_archived
        # return true if publshed_date is older than 10yeard
    end

    def move_to_archive
#         should reuse can_be_archived?() method.
# should change the archived property to true if the result of the can_be_archived?() method is true.
# should do nothing if the result of the can_be_archived?() method is false.
    end

def