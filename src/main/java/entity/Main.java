package entity;

import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class Main {
	public static void main(String[] args) 
		throws Exception{
		// TODO Auto-generated method stub
        Configuration cfg = new Configuration().configure();
        System.out.println("cfg.getProperties():" + cfg.getProperties());
        StandardServiceRegistry build = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();
        SessionFactory sessionFactory = cfg.buildSessionFactory(build);
        
        Session session = sessionFactory.openSession();
        
        session.beginTransaction();
//        Station station = new Station();
//        Region region = new Region();
//        region.setName("松江区");
//        session.save(region);
//        station.setRegion(region);
//        station.setName("魔仙堡");
//        session.save(station);
//        Company company = new Company();
//        company.setName("上海松江公共交通有限公司");
//        session.save(company);
//        session.getTransaction().commit();
        Bus bus = new Bus();
        Company com = new Company();
        com.setId(9);
        com.setName("雾之湖");
        session.save(com);
        bus.setCompany(com);
        bus.setId(14);
        bus.setName("松江14路");
        bus.setIsCircle(1);
        bus.setIsCross(0);
        bus.setLength(27);
        bus.setNumStation(94);
        bus.setTime(65);
        bus.setEndTimeFrom("21:00$21:03$21:07$21:08$21:09$21:10$21:11$21:13$21:14$21:15$21:16$21:17$21:20$21:21$21:22$21:23$21:24$21:26$21:28$21:29$21:30$21:31$21:33$21:34$21:35$21:36$21:38$21:39$21:40$21:41$21:42$21:44$21:45$21:46$21:47$21:48$21:49$21:50$21:53$21:54$21:55$21:57$21:58$21:59$22:00$22:03$22:05");
        bus.setEndTimeTo("21:00$21:02$21:05$21:06$21:07$21:08$21:10$21:11$21:12$21:15$21:16$21:17$21:18$21:19$21:20$21:21$21:23$21:24$21:25$21:26$21:27$21:29$21:30$21:31$21:32$21:34$21:35$21:36$21:37$21:39$21:41$21:42$21:43$21:44$21:45$21:48$21:49$21:50$21:51$21:52$21:54$21:55$21:56$21:57$21:58$22:02$22:05");
        bus.setIdFrom("183$184$185$186$187$67$248$247$264$263$262$261$260$259$60$258$257$209$256$148$150$255$254$253$252$177$11$12$188$162$251$33$32$250$249$29$28$85$67$248$247$68$187$186$185$184$183");
        bus.setIdTo("183$184$185$186$187$68$247$248$67$85$28$29$249$250$32$33$251$162$188$12$11$177$252$253$254$255$150$148$256$209$257$258$60$259$260$261$262$263$264$247$248$67$187$186$185$184$183");
        bus.setLenFrom("3$4$1$1$1$1$2$1$1$1$1$3$1$1$1$1$2$2$1$1$1$2$1$1$1$2$1$1$1$1$2$1$1$1$1$1$1$3$1$1$2$1$1$1$3$2$0");
        bus.setLenTo("2$3$1$1$1$2$1$1$3$1$1$1$1$1$1$2$1$1$1$1$2$1$1$1$2$1$1$1$2$2$1$1$1$1$3$1$1$1$1$2$1$1$1$1$4$3$0");
        bus.setStartTimeFrom("6:00$6:03$6:07$6:08$6:09$6:10$6:11$6:13$6:14$6:15$6:16$6:17$6:20$6:21$6:22$6:23$6:24$6:26$6:28$6:29$6:30$6:31$6:33$6:34$6:35$6:36$6:38$6:39$6:40$6:41$6:42$6:44$6:45$6:46$6:47$6:48$6:49$6:50$6:53$6:54$6:55$6:57$6:58$6:59$7:00$7:03$7:05");
        bus.setStartTimeTo("6:00$6:02$6:05$6:06$6:07$6:08$6:10$6:11$6:12$6:15$6:16$6:17$6:18$6:19$6:20$6:21$6:23$6:24$6:25$6:26$6:27$6:29$6:30$6:31$6:32$6:34$6:35$6:36$6:37$6:39$6:41$6:42$6:43$6:44$6:45$6:48$6:49$6:50$6:51$6:52$6:54$6:55$6:56$6:57$6:58$7:02$7:05");
        session.save(bus);
        session.getTransaction().commit();
        session.close();
        sessionFactory.close();
        System.out.println("运行完毕！");
	}

}
