'use strict';
var fetch = require('node-fetch');
/**
 * Read the documentation (https://strapi.io/documentation/developer-docs/latest/development/backend-customization.html#core-controllers)
 * to customize this controller
 */

module.exports = {
    apiPage: async (ctx) =>{

        try {
           const response =await fetch('https://g23-finalproject.herokuapp.com/areas');
           const data =await response.json();
           console.log('apiPage',data);
          return await ctx.render('apiArea/index', { data });
        } catch (err) {
          console.log('Errors on getting brands!');
          return await ctx.render('apiArea/index', { data: '' });
        }
},
apiAddPage:async(ctx)=>{

    return await ctx.render('apiArea/add',{
        name:'',
        population:'',
      });
},
apiAdd:async(ctx)=>{
    const name =ctx.request.body.name;
    const population=ctx.request.body.population;
    console.log(name,population);

    const form_data ={
        name: name,
        population: population,
      };
    try{
        const response = await fetch('https://g23-finalproject.herokuapp.com/areas',{
            method:'post',
            body:JSON.stringify(form_data),
            headers:{'Content-Type':'application/json'},
        })
        const data = await response.json();
        // await db.query('INSERT INTO brands SET ?',form_data);
        return await ctx.redirect('/apiAreas')
      } catch(err){
        console.log(err),
        res.render('apiArea/add',{
            name:form_data.name,
            population:form_data.population,
      });
      }      
},
apiEditPage:async(ctx)=>{
    const id = ctx.params.id;
    try{
      const response =await fetch(`https://g23-finalproject.herokuapp.com/areas/${id}`);
      const data =await response.json();
      // const [rows] =await db.query('Select * from brands WHERE id = ?',[id]);
      return await ctx.render('apiArea/edit',{
        id:data.id,
        name: data.name,
        population:data.population,
      });
    }catch (err){
        console.log(err);
      }
},
apiUpdate:async(ctx)=>{
    const name = ctx.request.body.name;
    const population = ctx.request.body.population;
    const id = ctx.request.body.id;
    const form_data ={
        name: name,
        population: population,
  }

  try{
    const response = await fetch(`https://g23-finalproject.herokuapp.com/areas/${id}`,{
            method:'put',
            body:JSON.stringify(form_data),
            headers:{'Content-Type':'application/json'},
            })
    // await db.query('UPDATE brands SET name = ?, url = ? WHERE id = ?',[
    //   name,
    //   url,
    //   id,
    // ]);
    // res.status(200).json({ message:'Updating successful'});
    return await ctx.redirect('/apiAreas');
  }catch (err){
    console.log(err);
  }
},
apiDelete:async(ctx)=>{
    let id = ctx.params.id;

    try {
      const response = await fetch(`https://g23-finalproject.herokuapp.com/areas/${id}`,{
              method:'delete',
    })
      // await db.query('DELETE FROM brands WHERE id = ?', [id]);
    } catch (err) {
      console.log(err);
    }
    return await ctx.redirect('/apiAreas');
}
};
