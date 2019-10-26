package TST_teamproject.user.model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

public class UserVo {
	private int tst_user_seq;
	private String tst_user_nickname;
	private String tst_user_id;
	private String tst_user_email;
	private String tst_user_pw;
	private String tst_user_img;
	private String tst_user_location;
	private String tst_user_key;
	private String tst_user_gender;
	private String tst_user_brith;
	private int tst_user_black;
	private int tst_user_isaccountnonexpired;
	private int tst_user_isaccountnonlocked;
	private int tst_user_iscredentialsnonexpired;
	private int tst_user_isenabled;
	private Collection<? extends GrantedAuthority> authorities;

	
	public int getTst_user_seq() {
		return tst_user_seq;
	}

	public void setTst_user_seq(int tst_user_seq) {
		this.tst_user_seq = tst_user_seq;
	}

	public String getTst_user_nickname() {
		return tst_user_nickname;
	}

	public void setTst_user_nickname(String tst_user_nickname) {
		this.tst_user_nickname = tst_user_nickname;
	}

	public String getTst_user_id() {
		return tst_user_id;
	}

	public void setTst_user_id(String tst_user_id) {
		this.tst_user_id = tst_user_id;
	}

	public String getTst_user_email() {
		return tst_user_email;
	}

	public void setTst_user_email(String tst_user_email) {
		this.tst_user_email = tst_user_email;
	}

	public String getTst_user_pw() {
		return tst_user_pw;
	}

	public void setTst_user_pw(String tst_user_pw) {
		this.tst_user_pw = tst_user_pw;
	}

	public String getTst_user_img() {
		return tst_user_img;
	}

	public void setTst_user_img(String tst_user_img) {
		this.tst_user_img = tst_user_img;
	}

	public String getTst_user_location() {
		return tst_user_location;
	}

	public void setTst_user_location(String tst_user_location) {
		this.tst_user_location = tst_user_location;
	}

	public String getTst_user_key() {
		return tst_user_key;
	}

	public void setTst_user_key(String tst_user_key) {
		this.tst_user_key = tst_user_key;
	}

	public String getTst_user_gender() {
		return tst_user_gender;
	}

	public void setTst_user_gender(String tst_user_gender) {
		this.tst_user_gender = tst_user_gender;
	}

	public String getTst_user_brith() {
		return tst_user_brith;
	}

	public void setTst_user_brith(String tst_user_brith) {
		this.tst_user_brith = tst_user_brith;
	}

	public int getTst_user_black() {
		return tst_user_black;
	}

	public void setTst_user_black(int tst_user_black) {
		this.tst_user_black = tst_user_black;
	}

	public int getTst_user_isaccountnonexpired() {
		return tst_user_isaccountnonexpired;
	}

	public void setTst_user_isaccountnonexpired(int tst_user_isaccountnonexpired) {
		this.tst_user_isaccountnonexpired = tst_user_isaccountnonexpired;
	}

	public int getTst_user_isaccountnonlocked() {
		return tst_user_isaccountnonlocked;
	}

	public void setTst_user_isaccountnonlocked(int tst_user_isaccountnonlocked) {
		this.tst_user_isaccountnonlocked = tst_user_isaccountnonlocked;
	}

	public int getTst_user_iscredentialsnonexpired() {
		return tst_user_iscredentialsnonexpired;
	}

	public void setTst_user_iscredentialsnonexpired(int tst_user_iscredentialsnonexpired) {
		this.tst_user_iscredentialsnonexpired = tst_user_iscredentialsnonexpired;
	}

	public int getTst_user_isenabled() {
		return tst_user_isenabled;
	}

	public void setTst_user_isenabled(int tst_user_isenabled) {
		this.tst_user_isenabled = tst_user_isenabled;
	}
	
	public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }
 
    public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
        this.authorities = authorities;
    }


	@Override
	public String toString() {
		return "UserVo [tst_user_seq=" + tst_user_seq + ", tst_user_nickname=" + tst_user_nickname + ", tst_user_id="
				+ tst_user_id + ", tst_user_email=" + tst_user_email + ", tst_user_pw=" + tst_user_pw
				+ ", tst_user_img=" + tst_user_img + ", tst_user_location=" + tst_user_location + ", tst_user_key="
				+ tst_user_key + ", tst_user_gender=" + tst_user_gender + ", tst_user_brith=" + tst_user_brith
				+ ", tst_user_black=" + tst_user_black + ", tst_user_isaccountnonexpired="
				+ tst_user_isaccountnonexpired + ", tst_user_isaccountnonlocked=" + tst_user_isaccountnonlocked
				+ ", tst_user_iscredentialsnonexpired=" + tst_user_iscredentialsnonexpired + ", tst_user_isenabled="
				+ tst_user_isenabled + "]";
	}

	
	
}
