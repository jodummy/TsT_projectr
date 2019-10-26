package TST_teamproject.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import TST_teamproject.main.dao.MainMapper;
import TST_teamproject.main.model.MainVo;

@Service
public class MainServiceImp implements MainService {

	@Autowired
	private MainMapper mapper;

	@Override
	public List<MainVo> test() {
		return mapper.test();
	}

}
