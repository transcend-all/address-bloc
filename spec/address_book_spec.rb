require_relative '../models/address_book'

RSpec.describe AddressBook do

  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq expected_email
  end

  describe "attributes" do
    it "responds to entries" do
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end

  describe "#remove_entry" do
    it "deletes one entry from the address book" do
    book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
    expect(book.entries.size).to eq(1)
    book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
    expect(book.entries.size).to eq(0)
  end
  end

  describe "#import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries_2.csv")
      book_size = book.entries.size

      expect(book_size).to eq 3
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries_2.csv")
      entry_one = book.entries[1]
      check_entry(entry_one, "Fred", "555-555-7777", "fred@blocmail.com")
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries_2.csv")
      entry_two = book.entries[2]
       check_entry(entry_two, "Jeff", "555-555-8888", "jeff@blocmail.com")
    end

    it "imports the 3rd entry" do
      book.import_from_csv("entries_2.csv")
      entry_three = book.entries[0]
      check_entry(entry_three, "Connie", "555-555-9999", "connie@blocmail.com")
    end


  end

end
