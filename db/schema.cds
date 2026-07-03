using {
        cuid,
        managed
} from '@sap/cds/common';

namespace tutorial.db;

entity Books : cuid, managed {
        title       : String;
        author      : Association to Authors;
        genre       : String;
        publishedAt : Date;
        pages       : Integer;
        price       : Decimal(10, 2);
        stock       : Integer;
        status      : Association to Bookstatus;
        chapters    : Composition of many Chapters
                              on chapters.book = $self;
}


// SAP CAP Tutorial for Beginners (Ep6) | Using Criticality in Fiori Elements
entity Bookstatus {
        key code        : String(1) enum {
                    AVAILABLE = 'A';
                    Low_Stock = 'L';
                    Unavailable = 'U';
            }
            criticality : Integer;
            displayText : String;
}


//type BookStatusCode : String(1) enum {
//        AVAILABLE = 'A';
//        Low_Stock = 'L';
//        Unavailable = 'U';
//}

// entity Books : cuid, managed {
//         title    : String;
//         author   : Association to many Authors2Book
//                         on author.book = $self;
//         chapters : Composition of many Chapters
//                            on chapters.book = $self;
// }

// entity Authors2Book : cuid {
// book   : Association to Books;
// author : Association to Authors;
// }

entity Authors : cuid, managed {
        name  : String;
        age   : Integer;
        books : Association to many Books
                        on books.author = $self;
}

// entity Authors : cuid, managed {
//         name  : String;
//         age   : Integer;
//         books : Association to many Authors2Book
//                         on books.author = $self;
// }

entity Chapters : cuid, managed {
        key book   : Association to Books;
            number : Integer;
            title  : String;
            pages  : Integer;
}
