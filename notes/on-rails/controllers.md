
# Patterns

## Create and update resources

```ruby
def new
  # renders :new template
end

def create
  @resource = Resource.new(parameters)

  if @resource.save
    redirect_to resources_path
  else
    render :new
  end
end

def edit
  # renders :edit template
end

def update
  @resource = Resource.find(params[:id])

  if @resource.update(parameters)
    redirect_to resource_path(@resource)
  else
    render :edit
  end
end

private

def parameters
  params.require(:resource).permit(:resource_attribute_1, :resource_attribute_1)
end
```
