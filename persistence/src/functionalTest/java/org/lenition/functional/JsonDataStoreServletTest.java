package org.lenition.functional;

import com.google.appengine.api.datastore.*;
import com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;
import com.jayway.restassured.http.ContentType;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static com.google.appengine.api.datastore.FetchOptions.Builder.withLimit;
import static com.jayway.restassured.RestAssured.expect;
import static com.jayway.restassured.RestAssured.given;
import static org.hamcrest.Matchers.*;
import static org.junit.Assert.assertEquals;

public class JsonDataStoreServletTest {

    private final LocalServiceTestHelper helper = new LocalServiceTestHelper(new LocalDatastoreServiceTestConfig());

    @Before
    public void setUp() {
        helper.setUp();
    }

    @After
    public void tearDown() {
        helper.tearDown();
    }


    @Test
    public void testAllowOriginHeaders() {
        expect().
            header("Access-Control-Allow-Origin", "*").
            when().
            get("/");
    }

    @Test
    public void persistSimpleEntity() {
        String kind = "testkind";
        String json = "{ \"testkey\" : \"testvalue\" }";
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        assertEquals(0, datastore.prepare(new Query(kind)).countEntities(withLimit(10)));
        assertEquals(0, datastore.prepare(new Query(kind)).asList(FetchOptions.Builder.withDefaults()).size());

        // Test put/creation
        given().contentType(ContentType.JSON).with()
                .body(json).
            expect().
                body("kind", equalTo(kind)).
                body("id", notNullValue()).
                body("name", notNullValue()).
                when().
                put("/" + kind);

        // Test get/retrieval
        expect().
                body(allOf(containsString("testkey"), containsString("testvalue"))).
                when().
                get("/" + kind);

    }

    @Test
    public void testPersistAgain() {
        // run again to prove we are not leaking state
        persistSimpleEntity();
    }

}
