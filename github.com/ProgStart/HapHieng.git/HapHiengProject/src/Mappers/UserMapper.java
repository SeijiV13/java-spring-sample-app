package Mappers;

import java.util.ArrayList;

import Models.User;

public interface UserMapper {
	
	public void changePassword(String password, String user);
	public String checkOldPasswordValidity(String username);
	public ArrayList<String> retrieveAllUsers();
	public void modifyEntriesofUser(String user, int se_active, int sre_active, int pe_active, int pre_active, int iqae_active, int ide_active, int tse_active, int gscr_active, int cfce_active, int ptse_active);
    public void modifyFilesofUser(String user, int if_active, int cf_active, int sf_active, int af_active, int cbf_active);
    public void modifyReportsofUser(String user, int sr_active, int srr_active, int pr_active, int prr_active, int iiot_active, int cl_active, int sl_active, int al_active);
    public void modifyProductListofUser(String user, int pli_active, int pll_active, int ei_active, int el_active, int enp_active, int i_active, int lpbc_active, int dis_active, int qai_active);
    public void modifyToolsofUser(String user, int ves_active, int vesr_active, int vep_active, int vepr_active, int vecr_active, int veqsa_active, int veid_active, int ct_active, int st_active, int ac_active, int cp_active);
    public User retrieveUserEntriesAccess(String user);
    public User retrieveUserFilesAccess(String user);
    public User retrieveUserReportsAccess(String user);
    public User retrieveUserProductListAccess(String user);
    public User retrieveUserToolsAccess(String user);
    
}
