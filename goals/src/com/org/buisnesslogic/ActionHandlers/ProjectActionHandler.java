package com.org.buisnesslogic.ActionHandlers;

import com.org.coursegenrator.utilities.Constants;
import com.org.sg.DAO.ProjectDAO;
import com.org.sg.DAO.UserDAO;
import com.org.sg.POJO.action.Project;

public class ProjectActionHandler extends AbstractActionHandler {

	Project project;
	
	public ProjectActionHandler(Project project)
	{
		this.project = project;
	}
	
	@Override
	public void processing() {
		
		if(project.getAction().equalsIgnoreCase(Constants.LOGGED))
			showProject();
		else if(project.getAction().equalsIgnoreCase(Constants.SHOW_ADD_EDIT))
			showAddEdit();
		else if(project.getAction().equalsIgnoreCase(Constants.ADD_EDIT))
			addEdit();
		else if(project.getAction().equalsIgnoreCase(Constants.DELETE))
			delete();
		else if(project.getAction().equalsIgnoreCase(Constants.OPEN_PROJECT))
			openProject();
		else if(project.getAction().equalsIgnoreCase(Constants.SHOW_KE))
			showKE();
		else if(project.getAction().equalsIgnoreCase(Constants.EXIT))
			showProject();
	}
	
	public void showProject()
	{
		Integer userId = (Integer)project.getSession().get(Constants.LOGIN_ID);
		ProjectDAO projectDAO = new ProjectDAO();
		project.setProjectList(projectDAO.findProjectsOfUser(userId));
		
		for(Project p : project.getProjectList())
		{
			p.setNumberOfLearners(p.getLearnerprojects().size());
			p.setOwnerName(p.getUser().getName());
		}
	}
	
	public void showAddEdit()
	{
		if(project.getId() != null && !project.getId().equals(0))
		{
			ProjectDAO projectDAO = new ProjectDAO();
			Project p = projectDAO.findById(project.getId());
			project.setName(p.getName().replaceAll("'", "\'"));
			project.setDescription(p.getDescription().replaceAll("'", "\'"));
			project.setDateCreation(p.getDateCreation());
			project.setOwnerName(p.getUser().getName().replaceAll("'", "\'"));
			project.setNumberOfLearners(p.getLearnerprojects().size());
			project.setId(p.getId());
		}
		
		project.setOwnerName(project.getSession().get(Constants.LOGIN_NAME).toString());
	}
	
	public void addEdit()
	{
		ProjectDAO projectDAO = new ProjectDAO();
		
		Project p;
		if(project.getId() != null && !project.getId().equals(0))
		{
			p = projectDAO.findById(project.getId());
			project.setNewObject(false);
		}
		else
		{
			UserDAO userDAO = new UserDAO();
			p = new Project();
			p.setUser(userDAO.findById((Integer)project.getSession().get(Constants.LOGIN_ID)));
			project.setNewObject(true);
		}
				
		p.setName(project.getName());
		p.setDescription(project.getDescription());
		
		projectDAO.save(p);

		project.setId(p.getId());
	}
	
	public void delete()
	{
		ProjectDAO projectDAO = new ProjectDAO();
		if(project.getId() != null && !project.getId().equals(0))
		{
			Project p = projectDAO.findById(project.getId());
			projectDAO.delete(p);
		}
	}
	
	public void openProject()
	{
		ProjectDAO projectDAO = new ProjectDAO();
		if(project.getId() != null && !project.getId().equals(0))
		{
			Project p = projectDAO.findById(project.getId());
			project.setId(p.getId());
			project.setName(p.getName());
			project.getSession().put(Constants.PROJECT_ID, p.getId());
			project.getSession().put(Constants.PROJECT_NAME, p.getName());
		}
	}
	
	public void showKE()
	{
		
	}

}
