using {tutorial.db} from '../db/schema';

service BookstoreService {
    entity Books      as projection on db.Books;
    entity Authors    as projection on db.Authors;
    entity Chapters   as projection on db.Chapters;
    entity Bookstatus as projection on db.Bookstatus;
//    entity Authors2Book as projection on db.Authors2Book;
}
annotate BookstoreService.Books with @odata.draft.enabled;

service Library {

    entity Books      as projection on db.Books;

}

annotate Library.Books with @odata.draft.enabled;
