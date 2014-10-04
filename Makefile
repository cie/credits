SERVER=penztar.meteor.com

run:
	rm -f .meteor/local/db/mongod.lock
	meteor

help:
	@echo "Possible targets: run, new-component-asdf-ghjk, commit, push, deploy"

commit:
	git add .
	if git status --porcelain | grep '^' > /dev/null; then git commit -a; fi


push: commit
	git push origin HEAD

deploy: push
	mrt deploy ${SERVER}


new-component-% :
	$(eval path=$(subst -,/,$*))
	$(eval name=$(notdir ${path}))
	@mkdir client/${path}
	@echo '<template name="${name}">\n    <div class="${name}">\n        \n    </div>\n</template>' >> client/${path}/${name}.html
	@echo 'Template.${name}.helpers\n\nTemplate.${name}.events' >> client/${path}/${name}.coffee
	@echo '.${name} {\n    \n}' >> client/${path}/${name}.less

