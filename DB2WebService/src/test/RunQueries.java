package test;


import java.io.IOException;

import org.basex.core.BaseXException;
import org.basex.core.Context;
import org.basex.core.cmd.XQuery;
import org.basex.data.Result;
import org.basex.io.serial.Serializer;
import org.basex.io.serial.XMLSerializer;
import org.basex.query.QueryException;
import org.basex.query.QueryProcessor;
import org.basex.query.iter.Iter;
import org.basex.query.value.item.Item;

/**
 * This example demonstrates three variants how XQuery expressions can be
 * evaluated.
 *
 * @author BaseX Team 2005-12, BSD License
 */
public final class RunQueries {
  /** Database context. */
  static Context context = new Context();

  /**
   * Runs the example code.
   * @param args (ignored) command-line arguments
   * @throws IOException if an error occurs while serializing the results
   * @throws QueryException if an error occurs while evaluating the query
   * @throws BaseXException if a database command fails
   */
  public static void main(final String[] args) throws IOException, QueryException {

    System.out.println("=== RunQueries ===");
    
    test();

    
    // ------------------------------------------------------------------------
    // Evaluate the specified XQuery
    String query =
        "for $x in doc('src/main/resources/xml/input.xml')//li return data($x)";

    // ------------------------------------------------------------------------
    // Process the query by using the database command
    System.out.println("\n* Use the database command:");

    query(query);

    // ------------------------------------------------------------------------
    // Directly use the query processor
    System.out.println("\n* Use the query processor:");

    process(query);

    // ------------------------------------------------------------------------
    // Iterate through all query results
    System.out.println("\n* Serialize each single result:");

    serialize(query);

    // ------------------------------------------------------------------------
    // Iterate through all query results
    System.out.println("\n* Convert each result to its Java representation:");

    iterate(query);

    // Uncomment this line to see how erroneous queries are handled
    // iterate("for error s$x in . return $x");

    // ------------------------------------------------------------------------
    // Flush output
    System.out.println();
  }

  private static void test() {
	
}

/**
   * This method evaluates a query by using the database command.
   * The results are automatically serialized and printed.
   * @param query query to be evaluated
   * @throws BaseXException if a database command fails
   */
  public static String query(final String query) throws BaseXException {
	  System.out.println("Started...");
	  String s = new XQuery(query).execute(context);
    System.out.println(s);
    System.out.println("Finished...");
    return s;
  }

  /**
   * This method uses the {@link QueryProcessor} to evaluate a query.
   * The resulting items are passed on to an {@link XMLSerializer} instance.
   * @param query query to be evaluated
   * @throws QueryException if an error occurs while evaluating the query
   */
  static void process(final String query) throws QueryException {
    // ------------------------------------------------------------------------
    // Create a query processor
    QueryProcessor proc = new QueryProcessor(query, context);

    // ------------------------------------------------------------------------
    // Execute the query
    Result result = proc.execute();

    // ------------------------------------------------------------------------
    // Print result as string.
    System.out.println(result);

    // ------------------------------------------------------------------------
    // Close the query processor
    proc.close();
  }

  /**
   * This method uses the {@link QueryProcessor} to evaluate a query.
   * The results are iterated one by one and converted to their Java
   * representation, using {{@link Item#toJava()}. This variant is especially
   * efficient if large result sets are expected.
   * @param query query to be evaluated
   * @throws QueryException if an error occurs while evaluating the query
   */
  static void iterate(final String query) throws QueryException {
    // ------------------------------------------------------------------------
    // Create a query processor
    QueryProcessor proc = new QueryProcessor(query, context);

    // ------------------------------------------------------------------------
    // Store the pointer to the result in an iterator:
    Iter iter = proc.iter();

    // ------------------------------------------------------------------------
    // Iterate through all items and serialize
    for(Item item; (item = iter.next()) != null;) {
      System.out.println(item.toJava());
    }

    // ------------------------------------------------------------------------
    // Close the query processor
    proc.close();
  }

  /**
   * This method uses the {@link QueryProcessor} to evaluate a query.
   * The results are iterated one by one and passed on to an
   * {@link XMLSerializer} instance. This variant is especially
   * efficient if large result sets are expected.
   * @param query query to be evaluated
   * @throws QueryException if an error occurs while evaluating the query
   * @throws IOException if an error occurs while serializing the results
   */
  static void serialize(final String query) throws QueryException, IOException {
    // ------------------------------------------------------------------------
    // Create a query processor
    QueryProcessor proc = new QueryProcessor(query, context);

    // ------------------------------------------------------------------------
    // Store the pointer to the result in an iterator:
    Iter iter = proc.iter();

    // ------------------------------------------------------------------------
    // Create a serializer instance
    Serializer ser = proc.getSerializer(System.out);

    // ------------------------------------------------------------------------
    // Iterate through all items and serialize contents
    for(Item item; (item = iter.next()) != null;) {
      ser.serialize(item);
    }

    // ------------------------------------------------------------------------
    // Close the serializer
    ser.close();
    System.out.println();

    // ------------------------------------------------------------------------
    // Close the query processor
    proc.close();
  }
}