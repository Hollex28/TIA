package OperacionesAritmeticas;

import org.opt4j.core.problem.ProblemModule;

public class OpsAritmeticalsModule extends ProblemModule {

	@Override
	protected void config() {
		bindProblem(OpsAritmeticasCreator.class,OpsAritmeticasDecoder.class,OpsArimeticasEvaluator.class);
	}

}
