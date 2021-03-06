package codeu.controller;
import java.io.IOException;
import java.time.Instant;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//had to add these imports
import codeu.model.data.User;
import codeu.model.store.basic.UserStore;

import org.mindrot.jbcrypt.*;

/**
  * Servlet class responsible for user registration.
  */
public class RegisterServlet extends HttpServlet {

	/**
	 * store class that gives access to Users
	 */
	//added this to store user
	private UserStore userStore;

	 /**
	  * Set up state for handling registration-related requests. This method is only called when
	  * running in a server, not when running in a test.
	  */
	 @Override
	 public void init() throws ServletException {
	   super.init();
	   setUserStore(UserStore.getInstance());
	 }

	 /**
	  * Sets the UserStore used by this servlet. This function provides a common setup method
	  * for use by the test framework or the servlet's init() function.
	  */
	 void setUserStore(UserStore userStore) {
	   this.userStore = userStore;
	 }

  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
	  request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
  }

  // this method is called when user clicks "submit" with a username and password
  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response)
		  	throws IOException, ServletException {
	  String username = request.getParameter("username");
	  String password = request.getParameter("password");
	  
	  //added 5/18/18 -Michelle
	  String school = request.getParameter("school");
	  String gradYear = request.getParameter("grad_year");
	  
	  String passwordHash = BCrypt.hashpw(password, BCrypt.gensalt());

	  if (!username.matches("[\\w*\\s*]*")) {
		  request.setAttribute("error", "Please enter only letters, numbers, and spaces.");
		  request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
		  return;
	  }

	  if (userStore.isUserRegistered(username)) {
		  request.setAttribute("error", "That username is already taken.");
		  request.getRequestDispatcher("/WEB-INF/view/register.jsp").forward(request, response);
		  return;
	  }

	  User user = new User(UUID.randomUUID(), username, passwordHash, Instant.now());
	  userStore.addUser(user);
	  
	    // added 5/18/18 -Michelle
      user.setGradYear(Integer.parseInt(gradYear));
      user.setSchool(school);
	  
	  response.sendRedirect("/login");
		response.sendRedirect("/users/" + user.getName());
  }

}
