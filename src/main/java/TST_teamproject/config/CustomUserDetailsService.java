package TST_teamproject.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.security.core.GrantedAuthority;
import TST_teamproject.user.dao.UserMapper;
import TST_teamproject.user.model.UserVo;

@Service
public class CustomUserDetailsService implements UserDetailsService{
    
    private static final String ROLE_PREFIX = "ROLE_";
    
    @Autowired
    UserMapper userMapper;
 
    @Override
    public UserDetails loadUserByUsername(String tst_user_id) throws UsernameNotFoundException {
        
    	UserVo member = userMapper.readUser(tst_user_id);
        if(member != null) {
            member.setAuthorities(makeGrantedAuthority(userMapper.readAuthority(tst_user_id)));
        }
        return new SecurityMember(member);
    }
    
    private static List<GrantedAuthority> makeGrantedAuthority(List<String> roles){
        List<GrantedAuthority> list = new ArrayList<>();
        roles.forEach(role -> list.add(new SimpleGrantedAuthority(ROLE_PREFIX + role)));
        return list;
    }
 
 
}

